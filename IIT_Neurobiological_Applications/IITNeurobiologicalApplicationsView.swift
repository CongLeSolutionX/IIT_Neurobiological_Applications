//
//MIT License
//
//Copyright © 2025 Cong Le
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//
//  IITNeurobiologicalApplicationsView.swift
//  IIT_Neurobiological_Applications
//
//  Created by Cong Le on 6/30/25.
//

import SwiftUI

// MARK: - Data Models for Network Visualization

/// Represents a single element in a neural network model, such as a group of neurons.
/// This structure is used to draw the nodes in the `NetworkGraphView`.
struct NeuralNode: Identifiable, Hashable {
    let id: Int
    var position: CGPoint
    let label: String
}

/// Represents a connection between two `NeuralNode` instances.
/// This structure defines the edges of the network graph.
struct NeuralConnection: Identifiable, Equatable {
    let id = UUID()
    let source: Int
    let target: Int
}

// MARK: - Main SwiftUI View

/// A SwiftUI view that provides an educational deep dive into Section 5 of Giulio Tononi's
/// paper, "An Information Integration Theory of Consciousness." It visualizes and explains
/// the neurobiological applications of IIT, such as why consciousness is associated with
/// the thalamocortical system and not the cerebellum.
///
/// The view is composed of several sections, each tackling a specific concept with
/// explanatory text, visual diagrams built in SwiftUI, and academic citations.
struct IITNeurobiologicalApplicationsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: - Header
                Text("IIT and the Brain: Neurobiological Applications")
                    .font(.largeTitle).bold()
                    .padding(.bottom)

                Text("The Information Integration Theory (IIT) provides a principled framework for explaining why consciousness is associated with certain brain structures and states over others. This section explores several key neurobiological applications of the theory, demonstrating how the concept of integrated information (Φ) can be applied to real-world observations.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom)

                // MARK: - Section 1: Thalamocortical vs. Cerebellum
                NeuroArchitectureView()
                Divider()

                // MARK: - Section 2: The Dynamic Core
                DynamicCoreView()
                Divider()
                
                // MARK: - Section 3: Split-Brain Consciousness
                SplitBrainView()
                Divider()

                // MARK: - References Section
                ReferencesView()

            }
            .padding()
        }
        .navigationTitle("Neurobiological Applications of IIT")
    }
}

// MARK: - Sub-Views for Each Concept

/// A view illustrating the architectural differences between the thalamocortical system
/// and the cerebellum, and explaining why this leads to different capacities for
/// information integration (Φ).
struct NeuroArchitectureView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("1. Thalamocortical System vs. The Cerebellum")
                .font(.title2).bold()

            Text("A central puzzle in neuroscience is why the thalamocortical system is essential for consciousness, while the cerebellum, which contains far more neurons, contributes minimally. IIT proposes that the answer lies in their fundamentally different architectures (Tononi 2004).")
                .lineSpacing(4)
            
            Text("• **Thalamocortical System:** Characterized by a mix of functional specialization and widespread integration. This architecture allows for the formation of a single, large 'main complex' capable of integrating vast amounts of information, resulting in a **high Φ value**.")
            
            Text("• **Cerebellum:** Organized into highly parallel, independent modules. This structure is efficient for coordinating automated tasks but prevents global information integration. It results in many small, isolated complexes, each with a **low Φ value**.")
            
            // Visual comparison of the two network types.
            HStack(spacing: 20) {
                NetworkGraphView(
                    title: "Thalamocortical-like (High Φ)",
                    nodes: .thalamocortical,
                    connections: .thalamocortical,
                    color: .blue
                )
                
                NetworkGraphView(
                    title: "Cerebellum-like (Low Φ)",
                    nodes: .cerebellum,
                    connections: .cerebellum,
                    color: .green
                )
            }
            .frame(height: 300)
            .padding(.top)
        }
    }
}


/// A view that creates a schematic diagram of the "Dynamic Core" concept,
/// illustrating how some neural processes are part of the main conscious complex
/// while others (like sensory inputs) are informationally insulated.
struct DynamicCoreView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("2. The Dynamic Core: What's In and What's Out?")
                .font(.title2).bold()

            Text("IIT predicts that not all active neurons contribute to conscious experience. Consciousness is a property of the 'main complex'—a 'dynamic core' of high Φ. Other neural circuits, though crucial for brain function, can be informationally insulated from this core, acting as inputs, outputs, or automated loops (Tononi and Edelman 1998).")
                .lineSpacing(4)
            
            // Schematic Diagram
            ZStack {
                // The Main Complex
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 250, height: 250)
                    .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                
                Text("Main Complex (High Φ)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .offset(y: -100)

                // Internal nodes of the complex
                Circle().fill(Color.yellow.opacity(0.8)).frame(width: 30).offset(x: -50, y: -50)
                Circle().fill(Color.yellow.opacity(0.8)).frame(width: 30).offset(x: 50, y: 20)
                Circle().fill(Color.yellow.opacity(0.8)).frame(width: 30).offset(x: 0, y: 60)

                // Informationally Insulated Components
                Text("Sensory Afferents (e.g., Retina)")
                    .font(.caption).bold().offset(x: -160, y: -70)
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 110))
                    path.addLine(to: CGPoint(x: 140, y: 150))
                }.stroke(style: StrokeStyle(lineWidth: 2, dash: [5])).foregroundColor(.blue)
                
                Text("Motor Efferents (e.g., Actions)")
                    .font(.caption).bold().offset(x: 160, y: 50)
                Path { path in
                    path.move(to: CGPoint(x: 270, y: 200))
                    path.addLine(to: CGPoint(x: 350, y: 230))
                }.stroke(style: StrokeStyle(lineWidth: 2, dash: [5])).foregroundColor(.red)
                
                Text("Subcortical Loop")
                    .font(.caption).bold().offset(x: 0, y: 150)
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 260))
                    path.addQuadCurve(to: CGPoint(x: 200, y: 340), control: CGPoint(x: 150, y: 300))
                    path.addQuadCurve(to: CGPoint(x: 200, y: 260), control: CGPoint(x: 250, y: 300))
                }.stroke(style: StrokeStyle(lineWidth: 2, dash: [5])).foregroundColor(.green)
            }
            .frame(height: 300)
            .padding(.vertical)
            
            Text("These external systems provide input and receive output but do not share in the integrated information of the core itself. Their causal link to the complex is limited to narrow 'ports-in' and 'ports-out.'")
        }
    }
}


/// A view demonstrating how consciousness can be split, as seen in split-brain patients.
/// It provides an interactive toggle to show the brain shifting from a unified complex
/// to two independent complexes.
struct SplitBrainView: View {
    @State private var isSplit = false

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("3. Splitting Consciousness")
                .font(.title2).bold()

            Text("Studies of 'split-brain' patients, whose corpus callosum connecting the two hemispheres was severed, show that consciousness itself can be divided (Sperry 1984). IIT explains this by modeling how cutting these connections fractures a single large complex into two smaller, independent ones, each supporting a private conscious experience.")
                .lineSpacing(4)
            
            Toggle(isOn: $isSplit.animation(.easeInOut)) {
                Text("Sever Corpus Callosum").bold()
            }
            .padding(.vertical)
            
            // Visual representation of the brain state
            VStack {
                Text(isSplit ? "State: Split Brain" : "State: Intact Brain")
                    .font(.headline)
                    .padding(.bottom, 5)

                HStack(spacing: isSplit ? 30 : 2) {
                    // Left Hemisphere
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange.opacity(0.6))
                        .frame(width: 100, height: 120)
                        .overlay(Text("Left Hemi.").bold())
                    
                    // Corpus Callosum
                    if !isSplit {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 15, height: 80)
                            .transition(.scale)
                    }
                    
                    // Right Hemisphere
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.purple.opacity(0.6))
                        .frame(width: 100, height: 120)
                        .overlay(Text("Right Hemi.").bold())
                }
                
                Text(isSplit ? "Result: Two independent complexes with lower Φ each." : "Result: One main complex with high Φ.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 5)

            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
        }
    }
}

// MARK: - Reusable Components

/// A view that renders a network graph from a set of nodes and connections.
/// Used to visualize the different brain architectures.
struct NetworkGraphView: View {
    let title: String
    let nodes: [NeuralNode]
    let connections: [NeuralConnection]
    let color: Color

    var body: some View {
        VStack {
            Text(title).font(.headline)
            GeometryReader { geometry in
                let size = min(geometry.size.width, geometry.size.height)
                ZStack {
                    // Draw connections
                    ForEach(connections) { connection in
                        if let sourceNode = nodes.first(where: { $0.id == connection.source }),
                           let targetNode = nodes.first(where: { $0.id == connection.target }) {
                            Path { path in
                                path.move(to: sourceNode.position.scaled(to: size))
                                path.addLine(to: targetNode.position.scaled(to: size))
                            }
                            .stroke(color.opacity(0.5), lineWidth: 1.5)
                        }
                    }
                    
                    // Draw nodes
                    ForEach(nodes) { node in
                        Circle()
                            .fill(color)
                            .frame(width: 20, height: 20)
                            .position(node.position.scaled(to: size))
                    }
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

/// A view dedicated to listing the academic references in Chicago style.
struct ReferencesView: View {
    let references = [
        "Sperry, Roger. 1984. “Consciousness, Personal Identity and the Divided Brain.” *Neuropsychologia* 22 (6): 661–73. https://doi.org/10.1016/0028-3932(84)90093-9.",
        "Tononi, Giulio. 2004. “An Information Integration Theory of Consciousness.” *BMC Neuroscience* 5 (1): 42. https://doi.org/10.1186/1471-2202-5-42.",
        "Tononi, Giulio, and Gerald M. Edelman. 1998. “Consciousness and Complexity.” *Science* 282 (5395): 1846–51. https://doi.org/10.1126/science.282.5395.1846."
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("References")
                .font(.title2).bold()
            
            ForEach(references, id: \.self) { reference in
                Text(reference)
                    .font(.footnote)
            }
        }
        .padding(.top)
    }
}

// MARK: - Preview Provider

struct IITNeurobiologicalApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IITNeurobiologicalApplicationsView()
        }
    }
}

// MARK: - Data Extensions & Helpers

/// Extension to provide pre-defined network configurations for visualization.
extension Array where Element == NeuralNode {
    static var thalamocortical: [NeuralNode] {
        return [
            .init(id: 1, position: .init(x: 0.2, y: 0.2), label: "A"),
            .init(id: 2, position: .init(x: 0.8, y: 0.1), label: "B"),
            .init(id: 3, position: .init(x: 0.5, y: 0.5), label: "C"),
            .init(id: 4, position: .init(x: 0.2, y: 0.8), label: "D"),
            .init(id: 5, position: .init(x: 0.9, y: 0.9), label: "E"),
            .init(id: 6, position: .init(x: 0.6, y: 0.2), label: "F")
        ]
    }
    
    static var cerebellum: [NeuralNode] {
        return [
            // Module 1
            .init(id: 1, position: .init(x: 0.2, y: 0.2), label: "A1"),
            .init(id: 2, position: .init(x: 0.1, y: 0.4), label: "A2"),
            .init(id: 3, position: .init(x: 0.3, y: 0.3), label: "A3"),
            // Module 2
            .init(id: 4, position: .init(x: 0.8, y: 0.2), label: "B1"),
            .init(id: 5, position: .init(x: 0.9, y: 0.4), label: "B2"),
            .init(id: 6, position: .init(x: 0.7, y: 0.3), label: "B3"),
            // Module 3
            .init(id: 7, position: .init(x: 0.5, y: 0.8), label: "C1"),
            .init(id: 8, position: .init(x: 0.4, y: 0.9), label: "C2"),
            .init(id: 9, position: .init(x: 0.6, y: 0.9), label: "C3")
        ]
    }
}

extension Array where Element == NeuralConnection {
    static var thalamocortical: [NeuralConnection] {
        return [
            .init(source: 1, target: 3), .init(source: 1, target: 4),
            .init(source: 2, target: 3), .init(source: 2, target: 5),
            .init(source: 3, target: 4), .init(source: 3, target: 6),
            .init(source: 4, target: 5), .init(source: 1, target: 6),
            .init(source: 2, target: 1), .init(source: 4, target: 2) // Long-range integration
        ]
    }
    
    static var cerebellum: [NeuralConnection] {
        return [
            // Module 1 (densely connected internally)
            .init(source: 1, target: 2), .init(source: 2, target: 3), .init(source: 3, target: 1),
            // Module 2 (densely connected internally)
            .init(source: 4, target: 5), .init(source: 5, target: 6), .init(source: 6, target: 4),
            // Module 3 (densely connected internally)
            .init(source: 7, target: 8), .init(source: 8, target: 9), .init(source: 9, target: 7)
            // Note: No connections *between* modules, illustrating informational insulation.
        ]
    }
}


/// Helper to scale normalized CGPoint to the view's geometry.
extension CGPoint {
    func scaled(to size: CGFloat) -> CGPoint {
        return CGPoint(x: self.x * size, y: self.y * size)
    }
}
